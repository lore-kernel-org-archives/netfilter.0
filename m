From: Andy Furniss <andy.furniss@dsl.pipex.com>
Subject: Re: mms and rtsp patches = make modules fail
Date: Fri, 30 Jan 2004 14:25:56 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <401A6974.4000603@dsl.pipex.com>
References: <4017BB98.7090203@dsl.pipex.com>	<1075368500.18100.7.camel@exile> 	<40190E1F.6090700@dsl.pipex.com> <1075422674.17013.8.camel@exile> 	<401A51B9.6090800@dsl.pipex.com> <1075467236.18951.2.camel@exile>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1075467236.18951.2.camel@exile>
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
To: Filip Sneppe <filip.sneppe@uptime.be>
Cc: netfilter@lists.netfilter.org

Filip Sneppe wrote:
> Hi Andy,
> 
> On Fri, 2004-01-30 at 13:44, Andy Furniss wrote:
> 
>>I've just retested with a new cvs pulled iptables and patch-o-matic-ng.
>>
> 
> Ah, we may be on to something here. I have been using the old
> patch-o-matic all this time.
> 
> Can you confirm that things work with the old pom runme script ? If so,
> I'll look at what may be going wrong with patch-o-matic-ng.
> 
> Thanks,
> Filip
> 
> 
> 

I tried with connbytes mms and rtsp - I got the chance to say n to the 
others this time, but got a different error.

ip_conntrack_rtsp.c:505: parse error before 
`this_object_must_be_defined_as_export_objs_in_the_Makefile' 
ip_conntrack_rtsp.c:505: warning: type defaults to `int' in declaration 
of `this_object_must_be_defined_as_export_objs_in_the_Makefile' 
ip_conntrack_rtsp.c:505: warning: data definition has no type or storage 
class make[1]: *** [ip_conntrack_rtsp.o] Error 1

Andy.





