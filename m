From: Michael Kearey <mutk@iprimus.com.au>
Subject: Re: iptc_* implementation queries
Date: Tue, 03 Feb 2004 14:54:12 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <401F2974.1040902@iprimus.com.au>
References: <s01e5eb1.078@prv-mail25.provo.novell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <s01e5eb1.078@prv-mail25.provo.novell.com>
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
To: netfilter@lists.netfilter.org

Jambunathan Jambunathan wrote:
> I am interested in knowing the netfilter infrastructure and I would
> like to know how iptables communicates with netfilter ( user to
> kernel space communication ) I understand that it happens through
> raw sockets through setsockot and getsockopt. Also there are a
> good number of iptc_* calls that are declared in libiptc.h which
> are used by the iptables user space tool. I would like to know 
> where I can see the implementations for these iptc_* calls. 
> I am unable to see this either in the kernel code nor in the
> iptables bz2 package. I am looking at 2.4.18 code of linux
> kernel fyi.
> 
> I will appreciate a mini code walk through or example.
> 

(Jambunathan sorry about replying directly to you..here is message to 
list)

Here is a reasonably good 'walk through'. It's ever so slightly 
inaccurate in some of the example code with redundant #includes, but 
is pretty good as a starting point. It really should 'This is how *I* 
did it', as there are several ways to acheive same thing...


http://www.tldp.org/HOWTO/Querying-libiptc-HOWTO/index.html


BTW, the libiptc isn't meant to be used as an 'API' to manipulate 
tables etc. Several reasons are given see 
http://netfilter.org/documentation/FAQ/netfilter-faq-4.html#ss4.5

Cheers,
Michael

