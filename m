From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: I would like to disallow  popups with iptables how can I accomplish
 that?
Date: Thu, 24 Apr 2003 19:25:51 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0304241908220.4541@dns.toxicfilms.tv>
References: <20030424154101.10542.27108.Mailman@kashyyyk>
 <01a201c30abc$3bb62cb0$0f00a8c0@juancarlitos>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01a201c30abc$3bb62cb0$0f00a8c0@juancarlitos>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: juanca <juanca@sat.com.py>
Cc: netfilter@lists.netfilter.org

>  I would like to avoid popups with iptables what rules do I have to
> implement?
Keep in mind that iptables is a packet filter, not a content filter,
thus acomplishing such a task would have to rely on ip addresses of what
you want to filter. eg. If you are using some kind of software which
connects to dedicated ad servers, you can just reject packets sent
to those IPs.
Remember that popups are initiated by the clients computer.


