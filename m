From: 0ndrej <0@amu.cz>
Subject: dst MAC address marking
Date: Tue, 06 May 2003 13:24:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EB79B7E.4030203@amu.cz>
References: <3815.207.173.214.34.1052206974.squirrel@webmail.everton.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3815.207.173.214.34.1052206974.squirrel@webmail.everton.com>
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

Hi all

we are making a free wireless broadband network in Czech Republic and we 
would like to invent a QoS approach to handle tranzit traffic via our 
routers.

The best thing which came to my mind is some MAC based marking, but as 
far as I know there is only source-MAC match in netfilter. Di you know 
about some dst-MAC match (which would effectively be kinda next-hop match?)

thank you for help
0ndrej


