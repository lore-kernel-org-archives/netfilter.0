From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: source and destination rule
Date: Mon, 21 Apr 2003 06:16:05 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304210615370.28639-100000@dell>
References: <35903.196.35.22.18.1050914530.squirrel@www.nobarrier.co.za>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <35903.196.35.22.18.1050914530.squirrel@www.nobarrier.co.za>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan <infomail@nobarrier.co.za>
Cc: netfilter@lists.netfilter.org

On Mon, 21 Apr 2003, Jonathan wrote:

> Hi there all
> 
> I would like to add a rule that has a source ip and a destination ip
> address and have a problem doing con someone point me in the correct
> direction.
> this is the rule i have tried
> 
> $IPTAB -A FORWARD -p tcp --dport 22 -i eth1 -s 192.168.1.0/24 -d
> 192.168.45.0/24 -syn -m state --state NEW -j ACCEPT
                  ^^^^

shouldn't that be "--syn" ?

rday


