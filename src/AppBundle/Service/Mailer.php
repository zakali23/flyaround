<?php


namespace AppBundle\Service;

class Mailer {

    /**
     * @var string
     */
    private $mailer;

    /**
     * @var string
     */
    private $templating;

    /**
     * Mailer constructor.
     * @param \Swift_Mailer $mailer
     * @param \Twig_Environment $templating
     */
    public function __construct(\Swift_Mailer $mailer, \Twig_Environment $templating)
    {
        $this->mailer = $mailer;
        $this->templating = $templating;
    }

    public function sendEmail($pilot, $recipient)
    {
            $body = $this->templating->render('email/contact.html.twig', [
                'recipient' => $recipient,
                'pilot' => $pilot
            ]);

        $message = (new \Swift_Message('Your Reservation'))
            ->setFrom('xavier.vierling@me.com')
            ->setTo($recipient)
            ->setBody($body, 'text/html');
        $this->mailer->send($message);
    }

}