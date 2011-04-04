From: William Fitzgerald <wfitzgerald@4c.ucc.ie>
Subject: Re: Allow/deny with iptables or application?
Date: Mon, 04 Apr 2011 11:53:26 +0100
Message-ID: <4D99A326.8090906@4c.ucc.ie>
References: <7a7jp6dtkhk47rls5q1u0kgg6tp4mgh0v6@4ax.com>
Reply-To: wfitzgerald@4c.ucc.ie
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7a7jp6dtkhk47rls5q1u0kgg6tp4mgh0v6@4ax.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gilles <gilles.ganault@free.fr>
Cc: netfilter@vger.kernel.org

A defense in depth strategy is best.

For example, if you are blocking access based on source IP address then apply the appropriate 
gateway firewall rules to permit intended SSH traffic only.

For example (there are many ways this can be achieved, others may provide different examples):
iptables -P FORWARD DROP
iptables -A FORWARD -i $externIface -s $permitedIPrange/address -d $SSHserverIPAddress -p tcp 
--dport 22 -j ACCEPT

where the $ prefix you replace with your specific details.

One could also use TCPWrappers locally installed on the (Linux-based) SSH server in conjunction with 
the gateway firewall.

For example,

/etc/hosts.deny
ALL : ALL

/etc/hosts.allow
sshd: $permitedIPrange/address

There are other areas that iptables can be beneficial to prevent DoS, brute force attacks and login 
attempts to an SSH server and other servers/systems. Look at the recent module and (conn)limit 
module as starting points. There are numerous examples on the Web providing example rule syntax and 
documentation for these scenarios.

Best of luck,
Will




On 04/04/11 11:30, Gilles wrote:
> Hello
>
> I started reading about iptables, and was wondering which solution is
> better for applications such as SSH or Asterisk that provide an
> allow/deny feature: Should I use the application or iptables? Is
> iptables more efficient?
>
> Thank you.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
_________________________________________
William M. Fitzgerald (MSc, PhD)
Postdoctoral Research Fellow,
Cork Constraint Computation Centre,
Computer Science Dept.,
University College Cork,
Cork,
Ireland.
-----------------------------------------
www.williamfitzgerald.net
www.linkedin.com/in/williamfitzgerald
http://4c.ucc.ie/web/people.jsp?id=143
________________________________________
