From: Kenneth Porter <shiva@sewingwitch.com>
Subject: Re: I need a clever solution for two Bittorrent machines behind
 a	firewall
Date: Thu, 18 Nov 2004 11:31:06 -0800
Message-ID: <260C0D3A0781D4EBEEED6053@[10.169.6.246]>
References: <00c801c4cd90$8980f090$0400a8c0@bradmorgan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00c801c4cd90$8980f090$0400a8c0@bradmorgan>
Content-Disposition: inline
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

--On Thursday, November 18, 2004 10:03 AM -0700 Brad Morgan 
<B-Morgan@concentric.net> wrote:

> I'm using a Linux firewall with IPTables as my home firewall.

Take a look at "port triggering". This is a feature in the Linksys WRT54G, 
which uses uClinux under the hood. When an outbound connection is seen to a 
particular port, a port forwarding rule is installed for the internal 
client. I'm guessing this is done by monitoring the iptables logs and 
installing a custom chain on demand that's removed after a period of 
inactivity.

