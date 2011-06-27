From: Sam Roberts <vieuxtech@gmail.com>
Subject: Re: dropping packets of --ctstate INVALID stopped working with 2.6.39.1?
Date: Mon, 27 Jun 2011 15:13:32 -0700
Message-ID: <BANLkTi=Kb2mDmK-sACbwYS0sqqadQ13rqA@mail.gmail.com>
References: <BANLkTinjipDzpFaz9pZN_TijmR0qOx-=AQ@mail.gmail.com>
	<4E04D639.2040905@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=HZNN9tV39HreUSIpF22Jp7xuL44e5uClTn3JMIHtaOY=;
        b=UQtXxNj78MOY5PYK98E/iHadWga54DB4oJNzuJ4x8Fgw+vbdX3Qezf7UAxA9AsOAU6
         GxkQO6FD89CHSY0LTtokY20uZ+QT3FowPHW8RjzMou/dAMySEgT9amO9vPu2OsSpOL0F
         IJPhA238hoQ+N+jtUssHSJfA6b5V+NEc5S0Zw=
In-Reply-To: <4E04D639.2040905@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On Fri, Jun 24, 2011 at 11:23 AM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>
> Sam Roberts a =E9crit :
>> I thought only a SYN packet should create a new connection, but PSH
>> packets seem to do it, too, now.
=2E..
> This behaviour is controlled by the net.netfilter.nf_conntrack_tcp_lo=
ose
> sysctl. Quoting Jozsef Kadlecsik :
>
>>> With tcp_loose enabled (default) conntrack accepts non-SYN packets =
as
>>>"NEW" ones, i.e. attempts to pick up connections from the middle.

That is exactly the issue. Thank you very much.

>> This worked with 2.6.38, but doesn't work with 2.6.39.1.
>
> Does the above sysctl have the same value on both kernels ?

It does not, I'm not sure why, since the default has been "loose" since=
 forever:

3aef0fd9 (Patrick McHardy     2007-02-12 11:16:58 -0800   39) static
int nf_ct_tcp_loose __read_mostly =3D 1;

But our build environment uses openembedded, plenty of room for crazine=
ss.

Cheers,
Sam
