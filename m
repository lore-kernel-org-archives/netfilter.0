From: "Ian Douglas" <ian@icreditvision.com>
Subject: RE: using iptables for poor-man's load balancing?
Date: Tue, 18 Feb 2003 14:02:43 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HMEBKOCKLOOEJGIOMFAPGEGOFJAA.ian@icreditvision.com>
References: <HMEBKOCKLOOEJGIOMFAPAEGOFJAA.ian@icreditvision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HMEBKOCKLOOEJGIOMFAPAEGOFJAA.ian@icreditvision.com>
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
To: Ian Douglas <ian@icreditvision.com>, netfilter@lists.netfilter.org

> Just curious if the following rules would work to round-robin the connections:

> /sbin/iptables -t nat -A PREROUTING -p udp -d 1.2.3.4 --dport 80  -j DNAT \
                                         ^^^

Rules will be duplicated for 'tcp' as well as 'udp'. Just curious though if the
format looks correct.

-id



