From: Rasmus Reinholdt Nielsen <rasmus@narani.dk>
Subject: Re: What ports need to be open to allow for mail?
Date: Thu, 10 Apr 2003 12:24:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.2.20030410122405.02794440@of23sm3.kadnet.dom>
References: <20030410093951.97924.qmail@web40207.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030410093951.97924.qmail@web40207.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: James Marcinek <james_marcinek@yahoo.com>, netfilter@lists.netfilter.org
Cc: jmarc1@eckerd.com

port 25 tcp will do for smtp, but you will need 110 tcp as well if you need 
pop3 access from the Internet.

/Rasmus

At 02:39 10-04-2003 -0700, James Marcinek wrote:
>Hello All,
>
>I'm trying to set up my mail server; however I want to
>make sure that I have the correct port(s) open. I
>already have TCP port 25 open; however do I also have
>to have UDP port 25 open as well? Any help would be
>appreciated.
>
>Thanks,
>James
>
>__________________________________________________
>Do you Yahoo!?
>Yahoo! Tax Center - File online, calculators, forms, and more
>http://tax.yahoo.com


