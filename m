From: Todd Landfried <tlandfried@hotmail.com>
Subject: Redirecting HTTPS traffic to third-party proxy
Date: Tue, 15 Mar 2005 12:24:19 -0700
Message-ID: <c12578b1c800d58c9c0d9312b36ba944@hotmail.com>
Mime-Version: 1.0 (Apple Message framework v619.2)
Content-Transfer-Encoding: 7bit
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

We're working on a project in the Middle East where we're required to 
route all HTTP and HTTPS traffic through a government-managed proxy 
server answering only on port 80 (both HTTP and HTTPS traffic).  We get 
the basic stuff to work, but HTTPS times out when attempting to connect 
to the proxy.

Does anyone know a way of solving this problem?

Thx

Todd


