From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Try to replace a Nokia/Checkpoint Firewall
Date: Thu, 13 Jun 2002 19:39:30 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206131839.g5DIdYA14399@Networker.rockstone.co.uk>
References: <F79wY9hp7Hp4Gx99yfF0000e5a0@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <F79wY9hp7Hp4Gx99yfF0000e5a0@hotmail.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Monday 03 June 2002 5:11 pm, Craig Smith wrote:

> I am trying to replace a Checkpoint firewall running on Nokia hardware.
> Under the config for the Nokia box I can tell the box to arp for address
> other than its own. How do I do this under Linux in a way that will
> IPtables can be used to translate the address to its ultimate destination
> behind the firewall? What would a IPtable rule look like? Thanks.

ifconfig eth0:1 <IP address> netmask <netmask>

will add an extra IP address to eth0, so it will correctly answer arp 
requests for that address

iptables rules, nothing different than you would have done anyway, except you 
always refer to the interface as "eth0" no matter which address you're 
talking about.   You can put as many addresses on one interface as you like.

 

Antony.

