From: Vincent Lim <vincent.lim@nestac.com>
Subject: Re: ip_conntrack_ftp problem
Date: 28 Mar 2003 16:27:59 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048840079.1236.45.camel@vincentlim>
References: <3E83FC78.7080801@ms.sapientia.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E83FC78.7080801@ms.sapientia.ro>
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
To: Budai Laszlo <lbudai@ms.sapientia.ro>
Cc: netfilter@lists.netfilter.org

On Fri, 2003-03-28 at 15:40, Budai Laszlo wrote:

> Chain FORWARD (policy ACCEPT)

<snipped the rest>

> ACCEPT     tcp  --  192.168.101.0/24     anywhere           tcp dpt:ftp
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           tcp dpt:ftp-data
> DROP       tcp  --  192.168.101.0/24     anywhere

<snipped more>

> but ftp trough the firewall still does not work. :(
> what is wrong?

I would think that the replying packets can't get back.
Try putting a:
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

-- 
Vincent Lim <vincent.lim@nestac.com>
NESTAC Solution Sdn Bhd


