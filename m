From: Ashutosh Naik <ashutosh@teneoris.com>
Subject: Re: Blocking IMs
Date: Thu, 05 Aug 2004 12:22:30 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <opsb8ypssisueqbq@192.168.1.10>
References: <20040805060738.87455.qmail@web8308.mail.in.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040805060738.87455.qmail@web8308.mail.in.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: g_sameer75@yahoo.com, firewall <netfilter@lists.netfilter.org>

On Thu, 5 Aug 2004 07:07:38 +0100 (BST), Sameer Gurung 
<sameersworld@yahoo.co.in> wrote:

> IS there a way i can block yahoo chat and instant
> messenger and msn from only specific clients from the
> network..... the clients get their ip address from a
> dhcp server....
> Any help would be appreciated
>


If U know the IP Addresses of the CLients, then a simple one for Yahoo IS

/sbin/iptables -A OUTPUT -s <Source_IP> -p tcp --destination-port 5050 -j 
DROP


Check the Port number on which the MSN Server Listens

Regards
-- 
Ashutosh Naik


