From: Luciano Miguel Ferreira Rocha <strange@nsk.no-ip.org>
Subject: Re: how can i combine these 2 iprules
Date: Fri, 5 Mar 2004 23:16:43 +0000
Sender: fedora-list-admin@redhat.com
Message-ID: <20040305231643.A22892@nsk.no-ip.org>
References: <3405.128.59.176.161.1078511273.squirrel@sojourn.dyndns.org>
Reply-To: fedora-list@redhat.com
Mime-Version: 1.0
Return-path: <fedora-list-admin@redhat.com>
Content-Disposition: inline
In-Reply-To: <3405.128.59.176.161.1078511273.squirrel@sojourn.dyndns.org>; from technical@sojourn.dyndns.org on Fri, Mar 05, 2004 at 01:27:53PM -0500
Errors-To: fedora-list-admin@redhat.com
List-Help: <mailto:fedora-list-request@redhat.com?subject=help>
List-Post: <mailto:fedora-list@redhat.com>
List-Subscribe: <http://www.redhat.com/mailman/listinfo/fedora-list>,
	<mailto:fedora-list-request@redhat.com?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://www.redhat.com/mailman/listinfo/fedora-list>,
	<mailto:fedora-list-request@redhat.com?subject=unsubscribe>
List-Archive: <http://www.redhat.com/archives/fedora-list/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: fedora-list@redhat.com
Cc: netfilter@lists.netfilter.org

On Fri, Mar 05, 2004 at 01:27:53PM -0500, Technical wrote:
> -A RH-Firewall-1-INPUT ! -s cnnp1.com  -j LOG --log-prefix "IPTABLES: "
> -A RH-Firewall-1-INPUT ! -s cnnp2.com  -j LOG --log-prefix "IPTABLES: "

-N iptlog
-A iptlog -s cnnp1.com -j RETURN
-A iptlog -s cnnp2.com -j RETURN
-A -j LOG --log-prefix "IPTABLES: "

Should do it.

Regards,
Luciano Rocha


-- 
fedora-list mailing list
fedora-list@redhat.com
To unsubscribe: http://www.redhat.com/mailman/listinfo/fedora-list
