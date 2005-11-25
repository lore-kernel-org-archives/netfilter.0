From: Tyler Retzlaff <rtr@softelsystems.com.au>
Subject: grovel netfilter_conntrack_xxx from applications how?
Date: Fri, 25 Nov 2005 15:33:17 +1100
Message-ID: <7B270B91-F48A-4B64-B0C0-49AAB6E7BB11@softelsystems.com.au>
Mime-Version: 1.0 (Apple Message framework v746.2)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

How does one query netfilter for information about conntrack connections
when they are established, disestablished etc..?

Basically for connections established via conntrack_xxx modules I want
to extract the details and use them in an application on the router.   
Is there
documentation to a C API for doing this?

Thanks

