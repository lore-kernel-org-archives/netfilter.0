From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: open ports 25/tcp and 110/tcp
Date: Wed, 3 Dec 2003 23:39:21 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312032339.21755.Antony@Soft-Solutions.co.uk>
References: <002101c3b9ef$53e5d780$0201a8c0@OurPC> <200312032301.11900.Antony@Soft-Solutions.co.uk> <002201c3b9f5$c7ee11a0$0201a8c0@OurPC>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002201c3b9f5$c7ee11a0$0201a8c0@OurPC>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wednesday 03 December 2003 11:32 pm, David F. Strauch wrote:

> Antony,
>
> I tried telnet from my WinXP machine to both open ports without any
> responce.  I'm hosting neither services on this machine.  It will be a
> gateway machine with a very minimal hardened installation.

Are you saying that from the same machine you did "nmap -sT -F -P0 -O 
xx.xx.xx.xx" and got a report including "SMTP port 25 open" and "POP3 port 
110 open", and also doing "telnet xx.xx.xx.xx 25" gives no response?

That makes no sense, because nmap -sT means a full TCP connect - the same as 
the telnet command would do.

Please confirm whether I am understanding correctly that you are doing both 
these tests from the same machine to the same address and getting different 
answers?

Antony.

-- 
All matter in the Universe can be placed into one of two categories:

1. Things which need to be fixed.
2. Things which need to be fixed once you've had a few minutes to play with 
them.

                                                     Please reply to the list;
                                                           please don't CC me.


