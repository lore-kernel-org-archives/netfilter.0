From: Alex Satrapa <alex@lintelsys.com.au>
Subject: Re: log
Date: Tue, 30 Mar 2004 16:44:38 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40691756.2060304@lintelsys.com.au>
References: <web-270866148@mail01.infosat.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-270866148@mail01.infosat.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

IT Clown wrote:
> will it log only for the default time period

What do you mean by that?  None of the rules that you add into a table will "expire" - you can rate limit using the appropriate rule.

> or will it log
> all packets as they come in and out untill you # it out?

Every packet that gets to this rule (ie: is not rejected or allowed before this rule) will get logged. Typically, you would rate-limit the log message as follows:

iptables -A FORWARD --protocol tcp -o ppp+ --destination-port 2766 -m limit --limit 10/hour --limit-burst 5 -j LOG --log-level warning --log-prefix "Deadhat "
iptables -A FORWARD --protocol tcp -o ppp+ --destination-port 2766 -j DROP

