From: lu zhongda <luzhongda@gmail.com>
Subject: Re: How to drop an idle connection with iptables?
Date: Fri, 25 Nov 2011 13:37:33 +0800
Message-ID: <4ECF299D.9040005@gmail.com>
References: <4ECCCF70.1080701@gmail.com> <jaipdd$irr$1@dough.gmane.org> <4ECE125F.8090101@gmail.com> <jal9sa$t42$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=BKLoPjmXN4LcipuuexUe25G5A9LVyRPi8sOXY9v80so=;
        b=cIA5022gdQDU/ZiyKK22EMD4X0rprUhgjysc/ssFJrzhJTfagcUbcCjzXoeXDTVSIL
         IFgXTLLT+uhM2SWygQk8/EFwFihVzrSMgeTPdDunyr88K0978DWZy6y/8JrTlV5XrtOB
         18r2m40xbx/5dqT8WTqKgL+RVObRY+t74anus=
In-Reply-To: <jal9sa$t42$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Cc: netfilter@vger.kernel.org

Hi Brian:

See my comments.

On 2011-11-24 19:30, Brian J. Murrell wrote:
> On 11-11-24 04:46 AM, lu zhongda wrote:
>> Hi Brian:
> Hi Lu,
>
>>      At least, I hope iptables can confirm whether a connection is i=
dle
>> or not by its rules, this is the key point of my problem.
> Perhaps there is a module which can do this but perhaps not because w=
hat
> you are proposing will actually break protocols based on TCP.
Agreed.


>>      I have used conntrack of iptables, it seems not work.
> iptables' conntrack works exactly as it should.  When it sees a TCP
> session go to ESTABLISHED (i.e. TCP 3-way handshake is completed) it
> allows packets on that session and continues to do so until the sessi=
on
> is destroyed with FIN and/or RST packets.
>
> To start dropping/rejecting packets before that TCP session is shutdo=
wn
> will break the protocol that is running on the socket because it expe=
cts
> the session to still be open.
>
> You didn't answer my other question though, which is why do you think
> you need to be dropping idle, yet still ESTABLISHED sessions (and
> breaking higher level protocols when you do that)?
The need to drop idle connection comes from one technical support reque=
st:
I need to confirm whether iptables can drop idle connection just like=20
some other commercial products can do.
I need to confirm whether iptables can do it=EF=BC=8C if it can ,what i=
s the=20
rule set.
If not then that is. I have no strong appeal that it can do it.
Thanks for your feedback.
> b.
>


