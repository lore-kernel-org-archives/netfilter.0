From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Sun, 01 Jan 2012 16:11:02 -0600
Message-ID: <op.v7fekow7x1lyi3@debiandesk2.net>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com> <op.v7e9nhxox1lyi3@debiandesk2.net> <CAKywjPpKpVdBz9boAhgj=-F488ayAtoLK1ua=GWKZ1hjNMWpZA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKywjPpKpVdBz9boAhgj=-F488ayAtoLK1ua=GWKZ1hjNMWpZA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: Anton Melser <melser.anton@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, 01 Jan 2012 14:41:24 -0600, Anton Melser <melser.anton@gmail.com> wrote:

>> I am new to this list and I have little experience with netfilter, but I
>> think I can help you. However, I need some clarification:
>>
>> When you say your machines need to be able to send email from each of those
>> 1600 public IPs, do you mean your 3-8 machines serve as SMTP relays for 1600
>> hosts, each with a public IP?  Do you mean that you are *not* the ISP, and
>> are providing only smtp service for the hosts?
>ESP. Think Mailchimp just a little smaller. Lots of clients need lots
> of IPs (it's a reputation thing, and quite an interesting computing
> problem, see http://blog.mailchimp.com/should-you-send-from-a-dedicated-ip-address/
> or just search for "email marketing dedicated ip" for an intro).
> A

So, I understand you are setting up 3-8 mail servers that will send out bulk email for 1600 hosts, so that the sender IP in the mails will have your 3-8 "reputable" IPs rather than one of the 1600 "unknown" IPs.

This would not be a regular email relay, since that would put the sender IP in the mail headers.  Are you thinking to use NAT to try to hide the sender IP? That's not the way to do it.

Frankly, this looks to me like bulk-email-laundering.  That is, it's a way to convey email "reputation" from one of 3-8 "trusted" IPs to the 1600 "unknown" ones.

Sorry, a have a personal issue with spam, and anything that could be used (if not by you, then by someone else) to get spam delivered. I think the email reputation of a public IP address should be earned, and it *should* take time to earn it.

-- 
Lloyd
