From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Want to do NAT for internal machines
Date: Sat, 1 Jun 2002 21:59:38 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206012059.g51KxdA20995@Networker.rockstone.co.uk>
References: <ENEBKGGOKDOEALIKAJMBOEDGCHAA.neil@JAMMConsulting.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <ENEBKGGOKDOEALIKAJMBOEDGCHAA.neil@JAMMConsulting.com>
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
To: netfilter <netfilter@lists.samba.org>

On Saturday 01 June 2002 9:54 pm, Neil Aggarwal wrote:

> Antony:
>
> It did not work.

Can you be more specific ?

1. What did you try ?
2. Did any packets get across the firewall to the destination machine ?
3. Did the destination machine send any packets back again ?
4. What is the routing table on the destination machine ?
5. What shows up in the connection tracking table on the firewall ?

Some, or more, of the above the information would help to figure out what's 
going on.


Antony.

