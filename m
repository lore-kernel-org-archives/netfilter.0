From: cc <cc@belfordhk.com>
Subject: Re: maybe out of topic
Date: Mon, 01 Sep 2003 09:47:10 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F52A51E.9040604@belfordhk.com>
References: <3F4EA5D3.1010504@skyinet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F4EA5D3.1010504@skyinet.net>
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
To: Netfilter Group <netfilter@lists.netfilter.org>

jaws wrote:

> I'm just wondering why im getting this error:
> 
> [root@tracker root]#/usr/sbin/tcpdump -i eth0
> Couldn't find user 'pcap'
> 
> [root@tracker root]# rpm -qa | grep pcap
> libpcap-0.7.2-1

I don't use RH, but the error message was
"Couldn't find user 'pcap'" and had nothing
to do with the library libpcap.

Now, being a non-RH user, I don't know what
the setup is like.  I'm just going by the
error message.

Why does tcpdump require the user 'pcap'?
I'm interested in knowing myself.





