From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: promiscuous mode w/ hook
Date: Fri, 22 Oct 2004 08:55:18 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41791146.8000208@pbl.ca>
References: <1098393242.b373a500rgopaul@umd.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1098393242.b373a500rgopaul@umd.edu>
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

Richard Gopaul wrote:
> Hi, 
> 
> I'm trying to put my ethernet interface into promiscuous mode and have all traffic sent to the netfilter prerouting hook.  I've read documentation on line and in the source that says that traffic doesn't make it to netfilter until after foreign promiscuous packets are dropped though, which makes me think this will be a bit of a challenge.  Any ideas?  

Either I'm missing what you want to do, or the question doesn't make any 
sense.  It doesn't matter if interface is in promiscuous mode or not. 
If apropriate Netfilter modules are loaded, packets will end up in 
prerouting chain (unless something in kernel drops them earlier, such as 
rp_filter).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

