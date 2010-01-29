From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: multiple external IP's - virtual NIC - DNAT problems
Date: Fri, 29 Jan 2010 10:36:11 -0800
Message-ID: <4B632A9B.1070100@mailinator.com>
References: <47b63751ecb9bdee2ada1d1be9deb980@mail.priorweb.be>    <4B62F4B7.80701@mailinator.com> <62981.81.165.168.224.1264785772.squirrel@webmail.priorweb.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <62981.81.165.168.224.1264785772.squirrel@webmail.priorweb.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: koen.news@koca.be
Cc: netfilter@vger.kernel.org

koen.news@koca.be wrote:
>> The command you seek is "ip".  Here's an example of adding an address to
>> an interface:  "ip address add 1.2.3.4/8 dev eth4".
>>
> Thx for the reply. That's indeed what I seek!
> 
> I guess I can put that command (or the debian variant) in the pre-up
> command for the interface?

I'm Debian ignorant.  In Redhat style systems I  bring up my interfaces 
without addresses or routes and put my custom code in /etc/rc.local.
