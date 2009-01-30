From: "Nikolay S. Rybaloff" <nowhere@hakkenden.ath.cx>
Subject: Re: newbie question: UDP is stateless ... right?
Date: Fri, 30 Jan 2009 22:41:52 +0300
Message-ID: <38A999C92A6E492EBCB813FCA2DF8F8A@Hakkenden>
References: <87fa72960901301050n7d982887waadc1fc090fc96ed@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Mr Vandeley <mr.vandeley@gmail.com>, netfilter@vger.kernel.org

Let's see what will the bible say: 
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#UDPCONNECTIONS
:)

--------------------------------------------------
From: "Mr Vandeley" <mr.vandeley@gmail.com>
Sent: Friday, January 30, 2009 9:50 PM
To: <netfilter@vger.kernel.org>
Subject: newbie question: UDP is stateless ... right?

> Hi,
> Please, excuse me this newbie question, but I don't understand
> correctly. For what I know, UDP connections are not statefull, so I
> can't track them... right?
> What I've been doing on my firewalls was explicitely accepting
> incoming packets from UDP privileged ports and so accepting answers to
> my UDP requests. Now I have found that if I accept RELATED,ESTABLISHED
> traffic without saying anything about the protocol, UDP answers will
> be accepted.
> I know that this isn't a question related to Netfilter but is the only
> place I know to ask about this.
>
> thanks.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
