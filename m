From: Andy Walden <andy@tigerteam.net>
Subject: libipt_drop.so: cannot open shared object file
Date: Tue, 29 Jun 2004 01:37:10 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E10006.3060805@tigerteam.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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


# ./iptables -I INPUT -s 217.238.177.2 -j drop
iptables v1.2.11: Couldn't load target 
`drop':/usr/local/lib/iptables/libipt_drop.so: cannot open shared object 
file: No such file or directory

I just started getting this one day. Searches show only three hits for 
that file and there is no sign of it in my distrobution or the source 
package. Any ideas as to what I'm seeing here? Thanks for the time.

-- 
Best Regards,
Andy Walden


