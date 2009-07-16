From: Simion Onea <simionea@gmail.com>
Subject: Re: Forwarding packets over the same LAN
Date: Thu, 16 Jul 2009 08:59:57 +0300
Message-ID: <1247723997.15457.46.camel@TestField.intranet.bem.md>
References: <1247493655.2316.104.camel@TestField.intranet.bem.md>
	 <1247494451.25529.52.camel@enterprise.ims-firmen.de>
	 <1247558286.7214.16.camel@TestField.intranet.bem.md>
	 <1247585686.1173.7.camel@enterprise.ims-firmen.de>
	 <e1ba8dde0907141201i5647546r78c2a66e24cad18f@mail.gmail.com>
	 <4A5D8626.6060002@plouf.fr.eu.org>
	 <1247643654.11785.6.camel@TestField.intranet.bem.md>
	 <cfb4555b0907151312w371c0aa3j7fc5db21d301a38a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=6Nyb/iE88gXip+ZxZuz3z+zSOq4ohAeL7rjowmRzVfE=;
        b=rZbeaPnT98jOt+ulMGrncTtdhCw+A+eiuhikmCTPFTm2bEV3Hogd7jDyUp82MVMClg
         zjMwIkks6ZtRIHHLuAWQkqKdRbX8ckMah0TJPEpZvi3+qATjy7bmmVevMytFAUF/Qsfo
         ygpMrJwNbfnY1Jv8Oh20di53oiNYxtwETBojA=
In-Reply-To: <cfb4555b0907151312w371c0aa3j7fc5db21d301a38a@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Williams <dmikewilliams@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, 2009-07-15 at 16:12 -0400, Mike Williams wrote:
> Simon,
> 
> Hi there.  Would you mind posting the output of iptables-save?  After
> reading about your battle with this it would be nice to see the
> complete set of working rules.  Also, having the final solution in the
> archives may help someone else.
> 
> Thanks,
> 
> Mike

Hi Mike!

Well, our set of iptables rules is rather large. It performs several
tasks like blocking access to some ports on the server, blocking access
to some hosts, performing NAT for other hosts, etc.
To be useful for the community, this set of rules would require a
detailed explanation which I am not prepared to give because our
company's policies do not allow me to do so.
But the solution to my problem were the couple of rules proposed by
Thomas Jacob:
> On Mon, 2009-07-13 at 16:14 +0200, Thomas Jacob wrote:
> > You need DNAT+SNAT for this:
> > 
> > # Redirect to IP:Port
> > iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 10025 \
> >      -j DNAT --to-destination 172.20.1.254:25
> > 
> > # Ensure that the replies come back to us
> > iptables -t nat -A POSTROUTING -o eth0 -p tcp --dport 25 \
> >          -d 172.20.1.254  -j SNAT --to-source 172.20.1.245

These rules did the job, but there was another one that I didn't notice
at first. This rule was blocking traffic to port 25:

# iptables -A FORWARD -p tcp -s 172.20.1.245 -d 0/0 --dport 25 -j DROP

As soon as I removed this rule everything went fine.

Regards,
Simion.


