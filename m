From: "Craig Bernstein" <cbernstein@cbernstein.com>
Subject: Logging NAT Translations
Date: Fri, 18 May 2007 20:15:32 -0700
Message-ID: <ae1f24730705182015j533102bah985e9ad0e905cd2a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

I can't believe this isn't a FAQ; I apologize if I missed something in
my searches.

Is there a way to log connections along with all of their NAT translation data?

I am using a Debian (Sarge) system to SNAT guest users from private
address space to the Internet, and I need to keep a record that
includes both their internal and external addresses.

Simply logging before the SNAT rule leaves out the external address,
leaving me only with the original RFC1918 source address.
/proc/net/ip_conntrack has the information I need, but no way to send
it to the log it at the beginning and/or end of the session.

There HAS to be an easy way to do this!  Right?

Thank you...

-- 
...Craig

