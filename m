From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: ipt_string
Date: Mon, 20 Sep 2004 14:19:35 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <414F2D47.1060409@pbl.ca>
References: <20040920184604.44308.qmail@web90004.mail.scd.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040920184604.44308.qmail@web90004.mail.scd.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Linux Query wrote:
> Hi !
>  
> I am new to linux and networking. However I have set up a router on a redhat 9 machine and am using htb.init + squid delay pools for bandwidth limiting. But I would like to do away with squid since I am just using it for the delay pools feature in order to limit downloading based on kewords such as .exe .mp3 .mpeg ..etc. The other day I came to know about the ipt_string module through google search and am wondering if thats what I am looking for. I am looking for something with which i can mark packets based on keywords and then limit the bandwidth for such packets with htb. Is the ipt_string module suitable for this ? If not, then please suggest an alternative.

Netfilter isn't really the right tool to do application level filtering. 
  It is a great tool, but it is designed to work on lower level protocols.

You can try using ipt_string, but you will run into serious limitations. 
  ipt_string operates on single packet.  If the string you are trying to 
match is (for whatever reason) broken into multiple packet, ipt_string 
will not find it.  Also, ipt_string does not know anything about 
application level protocols (such as HTTP).  If it finds ".exe" anywhere 
in the packet's payload, it will match (whereas Squid will match only if 
it is part of URL, and you can specify that it must be at the end of the 
URL).

If I were you, I'd stick with Squid to do application level filtering.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

