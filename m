From: "Vernon A. Fort" <vfort@provident-solutions.com>
Subject: Re: firewall protocols
Date: Thu, 07 Apr 2005 13:35:31 -0500
Message-ID: <42557D73.7070500@provident-solutions.com>
References: <5.2.1.1.0.20050407162450.020caa30@pop.av.eastlink.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5.2.1.1.0.20050407162450.020caa30@pop.av.eastlink.ca>
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
To: netfilter@lists.netfilter.org

Ted Gervais wrote:

> I have just discovered that people are not able to telnet to my system 
> and I have been told that it is not because I don't have the necessary 
> ports open but rather the problem is because of protocols??
>
> I have no idea what this means and am wondering if someone could 
> explain.  If it is needed I can supply a copy of my firewall  but was 
> wondering first if anyone has heard of this.

you should be able to list the open port from the iptables command:  
iptables -L -nv
and
telnet localhost to see if telnet if running

from the iptables, you should see port 23 open from the ip address 
needing access.  you should also be able to telnet to the localhost.

Vernon

