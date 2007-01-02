From: Vitek <zaklik@gmail.com>
Subject: ways to modify iptables inside C/C++ aplication
Date: Tue, 02 Jan 2007 17:17:01 +0100
Message-ID: <459A857D.3020703@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi,

============================================
Short version:

Is there any way to include iptables sources to c++ aplication and just 
call do_command() ?

If I'll use libiptc library:
Is it possible to use libiptc in C++?
How can I access layer7 match?

============================================
Long version:

I have a project for analyzing network flow of services on server 
providing Internet connection for small LAN. I created a perl script for 
setting iptables firewall (from text filelist of users) and reading 
counters calling system("iptables -L vxn") and spliting data in perl 
script. This is too slow for real time statistic, so I decide to create 
C/C++ aplication for this purpose.

I have few requirements on this application:

- I need to use Layer7 extension for iptables - for recognizing some 
services (p2p for example)
- Clint/Server based model ( I would like to modify/read iptables 
structure using webbase client - php )
- If it's possible - have access to database server (I'm not sure if 
this is possible in C)

I already create piece of C code using libiptc to access iptables 
counters and create new chains, but I couldn't find any learn examples 
how to insert rules using libiptc etc..
I think that it will be quicker and better to use iptables sources and 
just call do_command(), but...

The questions:
Is there any way to include iptables sources to c++ aplication and just 
call do_command() ?

If I will use libiptc
Is it possible to use it in C++?
How can I access layer7 match?

I see 3 solutions:

1)
Create C++ aplication and just call system( .. ) everywhere when i need 
to modify/read firewall - but I'm sure that it will be still too slow.

2)
Use Libiptc just for reading counters and all other do by calling 
system() - not very nice solution and I'm not sure if this is possible 
in C++

3)
Use pure C using iptables source codes - but how? I was testing just by 
modifing iptables-standalone.c - it works fine.

It seems that it will be little bit challange for me (I'm not 
experienced C/C++ programmer ;)

Thank you very much for answers!

Cheers,
Vitek


