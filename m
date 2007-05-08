From: "Ramsurrun Visham" <vishamr@gmail.com>
Subject: Unable to see entries in ip_conntrack file!!
Date: Tue, 8 May 2007 14:45:20 +0400
Message-ID: <802220ef0705080345u7ac7890eq8e3f3435a8ca268e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=QWyzcJzHoUHkWjMYJjvy7ANRRb6bd0A27IXoc1MXNbk70Nb/B1bO9iV8S7zmjnzDgVbV/dfK0p1fdhYQaQkg99B///1WwZXiqcT7B9cFAZW4PJA+k+CWzTYUuP0hv43RQqYOGXrpSLtIjgG/WRERbuvJs65UBeK/u5GQqVqqdnk=
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

Hi to all,

I'm trying to see the connections established on a firewall by looking
at the contents of the file ip_conntrack by using this command:

cat /proc/net/ip_conntrack

The rules used on the firewall are:

iptables -P FORWARD DROP
iptables -A FORWARD -s 192.168.10.0/24 -d 192.168.10.0/24 -p icmp -m
state --state NEW,ESTABLISHED,RELATED -j ACCEPT

I have chosen all the modules related to connection tracking in my
2.6.20.4 kernel on the firewall machine. I'm using iptables 1.3.7 and
Fedora Core 5.

What might be going wrong?

Warm regards,
Visham

