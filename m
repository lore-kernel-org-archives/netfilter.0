From: "j.travis" <skynet@psinode.com>
Subject: -m tcp
Date: Wed, 24 Mar 2004 10:28:05 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <017e01c411cd$c358a170$0300a8c0@max2>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Is  there any (functional) difference between these two statements?

-A INPUT -p tcp -m tcp --dport 80 -j ACCEPT 

-A INPUT -p tcp --dport 80 -j ACCEPT 


