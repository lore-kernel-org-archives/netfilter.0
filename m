From: "Leon Stankowski" <leons@voicenet.com>
Subject: RE: Question about nfmark
Date: Wed, 4 Jun 2003 21:17:21 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEDIJIDBADCKKAGHJNMOEDHCJAA.leons@voicenet.com>
References: <20030604183302.31857.2836.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030604183302.31857.2836.Mailman@kashyyyk>
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

In a chain you can make the target "MARK" and assign it a ID.  Example:

	iptables -t mangle -A PREROUTING -p tcp --dport 80 -j MARK --set-mark 25

Later in any chain you can use the "mark" match item to look for these
marked packets / streams.  Example:

	iptables -t nat -A POSTROUTING --mark 25 -j SNAT --to-source 10.0.0.1

Have fun,
Leon

-----Original Message-----
From: Abhinav Gupta <gupta@cpsc.ucalgary.ca>
Subject: Question about nfmark

Hi,
I am a newbie to netfilter. While going through some code, I saw a
comment that nfmark can be used for communicating between the different
hooks. Could someone please explain me how this can be done.

Thanks in advance.

Abhinav.


