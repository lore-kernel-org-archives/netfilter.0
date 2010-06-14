From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Cannot destroy queue, nfnl_talk never returns
Date: Mon, 14 Jun 2010 20:15:54 +0200
Message-ID: <4C1671DA.1060501@tana.it>
References: <4C136D70.3050902@tana.it> <4C1567EE.2040802@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1276539355; bh=Vo/qVKc3E96WD9pw506OhbvDhmEoHNq8Vjh/pMkmcCk=;
	l=2884;
	h=Message-ID:Date:From:MIME-Version:To:CC:References:In-Reply-To:
	 Content-Transfer-Encoding;
	b=Rm7pP6QPahf0F7ExM1+qjKLC/L+ysXxGp9GVIT80ibO3eC+Nha00nH2BoJWwZrQiT
	 oqyoRRLwvSDEjJ0zJFd8vGzNe3t8EcHQTvm9yAdl/PCNwzOxqLfdvvej6/nbrFkPGX
	 I+SyOx6+75JP/+I6xML+/TAS/0pPGuJTf35snW54=
In-Reply-To: <4C1567EE.2040802@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On 14/Jun/10 01:21, Pablo Neira Ayuso wrote:
> Alessandro Vesely wrote:
>>  it has happened again (previous time was 5 May 2010).
>>  This time I used gdb rather than strace, but still don't know what's wrong:
>>
>>  Calling recv on the nfq_fd had returned -512. (why?)
>>  At that point my daemon calls nfq_destroy_queue(), which does not return:
>>
>>  (gdb) bt
>>  #0  0x00007ff3b6e50450 in recvfrom () from /lib/libc.so.6
>>  #1  0x00007ff3b696105c in nfnl_talk () from /usr/lib/libnfnetlink.so.0
>>  #2  0x00007ff3b79a429f in __build_send_cfg_msg (h=0x6073a0, command=2 '\002', queuenum=<value optimized out>, pf=0)
>>      at libnetfilter_queue.c:112
>>  #3  0x00007ff3b79a430d in nfq_destroy_queue (qh=0x607410) at libnetfilter_queue.c:258
>>  #4  0x00000000004021f7 in daemon_loop (h=0x6073a0, db=0x606570) at ibd-judge.c:477
>>  #5  0x0000000000402a75 in main (argc=<value optimized out>, argv=<value optimized out>) at ibd-judge.c:739
>>
>>  Any idea?
> 
> I think that this is fixed in:
> 
> http://git.netfilter.org/cgi-bin/gitweb.cgi?p=libnetfilter_queue.git;a=commit;h=bc56a6becbd4c4edf743ca3bee32eb0329fc5e5a
> 
> That fix is included in libnetfilter_queue-0.0.17. You seem to be using
> an older version since you point to nfnl_talk() which is not used
> anymore in the library.
> 
> Upgrade and let us know if that fixes your problem.

Thanks a lot, Pablo. Upgrading has been less of a pain than I would have
anticipated, as it is in squeeze and dependencies are quite minimal.

Now my filter is running with it. I'll wait to see if I still get problems.

In case it serves other lenny users, the relevant steps for upgrading are:

1) ensure apt configuration reads squeeze too: the three files
/etc/apt/sources.list
/etc/apt/preferences
/etc/apt/apt.conf
should be set more or less as described in
http://jaqque.sbih.org/kplug/apt-pinning.html

2# apt-get update

3# apt-get install -t testing libnetfilter-queue1
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  libnetfilter-queue-dev libnetfilter-queue1-dbg libnfnetlink-dev libnfnetlink0
The following packages will be upgraded:
  libnetfilter-queue-dev libnetfilter-queue1 libnetfilter-queue1-dbg libnfnetlink-dev libnfnetlink0
5 upgraded, 0 newly installed, 0 to remove and 1225 not upgraded.
Need to get 64.5kB of archives.
After this operation, 4096B of additional disk space will be used.
Do you want to continue [Y/n]? Y
...

Now, I have
# apt-cache policy libnetfilter-queue1
libnetfilter-queue1:
  Installed: 0.0.17-1
  Candidate: 0.0.17-1
  Version table:
 *** 0.0.17-1 0
        200 http://debian.fastweb.it squeeze/main Packages
        100 /var/lib/dpkg/status
     0.0.13-1 0
        800 http://debian.fastweb.it lenny/main Packages
