From: "Ian Douglas" <ian@icreditvision.com>
Subject: RE: Restricting IP addresses from ports
Date: Tue, 25 Feb 2003 09:51:58 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HMEBKOCKLOOEJGIOMFAPKENJFKAA.ian@icreditvision.com>
References: <Pine.LNX.4.44.0302261012070.23380-100000@ns1.teamraf.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0302261012070.23380-100000@ns1.teamraf.com>
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
To: Bob <q@teamraf.com>, netfilter@lists.netfilter.org

>   How do I allow a specific IP address access to a port like SSH?  I want
> to deny all access to ports on a system that I manage except for specific
> addresses.

In a general sense, you create a rule to ALLOW a specific IP address (or range),
and then explicitly REJECT/DROP/TREJECT/etc that port for everyone else.

-id


