From: "Shaun T. Erickson" <ste@smxy.org>
Subject: incoming interface confusion question
Date: Mon, 21 Jun 2004 13:45:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40D71EC4.7090900@smxy.org>
Reply-To: ste@smxy.org
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

Are there any cases where iptables can be confused about what interface 
a packet came in on? Can a packet arriving on interface A ever be 
reported as arriving on interface B?

I had an incident this weekend, and am trying to be certain that the 
packets came in the interface my system said it did. It's a Red Hat 9 
system, running their stock 2.4.20-8 kernel.

	-ste

