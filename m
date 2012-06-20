From: sreejith menon <sreejithjmenon@gmail.com>
Subject: Applying Nat rules during traffic
Date: Wed, 20 Jun 2012 20:35:03 +0530
Message-ID: <CACJKonqQND2VnPgsiE5=FTJp6qkjKjTZKVvfMAvTVThsjo=vPA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=IA9/tb0pA4ql+MX/8bELTlZM4tYnkFOHeBh+UiU2lxA=;
        b=FXcBETmOAgDdtHenfSerxJIukYKbufdV/NyqhUURyEdVqXKC5dBPOzS0epvmRJJqZK
         hU9uvVHHT/FVGZ7GJM54pKK6RdEg5pgM0iqWxVTao9ly61aGGlcJ0bEAY4CZpGNbv9pU
         clGNKj6CqjXVCiBOfwCxWaEQRaYOh7tmkEfTmHakblTUXNND7Efa09tx9rlkrAP+VhSj
         M4dNUXXwiSVmO9g8YlV4lMjiZBraWc+yG9ZfFKo/nWDUVoepRYPdEY2gF6jooLV68AIS
         SISkfJSoXq98OLO/vFedW+AQjRAG28Kod6C6UisuylV0I8xAgz6qXG1ZfdRGb4el2QNv
         ++IQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have enabled IP masquerading on an outgoing interface using the below command

 iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE.

But it doesnt seem to take effect if the traffic was ongoing. As soon
as i stop and start traffic the rule is effective.

Is it implemented this way or do i need to apply xtables add on patch
to fix this issue?

Currently i am doing a conntrack -F to avoid this issue. But i would
like to have a permanent fix. Any ideas?

regards
sreejith
