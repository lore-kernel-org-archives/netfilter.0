From: Rio Martin <rio@martin.mu>
Subject: Blocking Streaming Media (Was: Re: (no subject)..)
Date: Tue, 1 Jun 2004 09:43:02 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406010943.02317.rio@martin.mu>
References: <6.0.3.0.2.20040531211546.02412c80@mx1.girotto.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.3.0.2.20040531211546.02412c80@mx1.girotto.com.au>
Content-Disposition: inline
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

On Monday 31 May 2004 18:18, Ivan wrote:
> Hi,
> I am looking for a solution to block streaming media using iptables.
> I have found that some of my users are listening to radio stations using
> internet, which has pumped up the
> internet bill significantly, and of course put a choke on my internet
> links. Does anyone know of a solution for blocking just the streaming media
> traffic from any web site, while still allowing
> the access to the website it self?
> Thanks,
> Ivan


Hiye Ivan,
The problem you faced was users connecting to Internet Radio Stations using 
web port (port 80) isnt it ? I give u an example like LaunchCast from Yahoo 
or other stations using port 80 as their service port.

This is become a serious problem when bandwidth allocated not so wide. The 
only thing in my mind, try to apply the magic of patch-o-matic STRING. 
Examine correctly what packets arrived or what kind of streaming packets sent 
by server. Block using those STRING.

Regards,
Rio Martin.

