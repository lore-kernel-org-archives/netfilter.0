From: Dirk Morris <dmorris@metaloft.com>
Subject: matching on ICMP responses
Date: Sun, 18 Jul 2004 13:57:14 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FAE42A.6090300@metaloft.com>
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

Is there a way to match only certain ICMP responses that relate to 
certain other sessions.

example: is there a rule/match I can use to specify that I want to block 
all ICMP port unreachable errors, but _only_
in response to UDP packets (not TCP). Or maybe both TCP and UDP, but 
only port 123. etc etc.

Does this functionality exist? (possibly in some patch?)


