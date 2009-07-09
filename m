From: "Victor A. Safronov" <vitek@vitek.tomsk.ru>
Subject: Re: ipset nethash with cidr 32
Date: Fri, 10 Jul 2009 00:34:42 +0700
Message-ID: <4A562A32.1050006@vitek.tomsk.ru>
References: <4A2362FE.7040905@vitek.tomsk.ru> <alpine.DEB.2.00.0906021042280.11925@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0906021042280.11925@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

Jozsef Kadlecsik wrote:
> You can maintain one set for the network 
> addresses, one for the IP addresses and create a setlist type of 
> set with both "subsets" as members.
Now I have a trouble with 'setlist'.
For example:
[root@tomgate /]# ipset -N pool1 ipmap --network 192.168.0.0/24
[root@tomgate /]# ipset -A pool1 192.168.0.1
[root@tomgate /]# ipset -N myset setlist
[root@tomgate /]# ipset -A myset pool1
[root@tomgate /]# ipset -T pool1 192.168.0.1
192.168.0.1 is in set pool1.
[root@tomgate /]# ipset -T pool1 192.168.0.2
192.168.0.2 is NOT in set pool1.
[root@tomgate /]# ipset -T myset 192.168.0.1
192.168.0.1 is in set myset.
[root@tomgate /]# ipset -T myset 192.168.0.2
192.168.0.2 is in set myset.
[root@tomgate /]# ipset -T myset stupidgarbage
stupidgarbage is in set myset.

When testing my setlist I always get "is in set".
I suppose that is not normal.
