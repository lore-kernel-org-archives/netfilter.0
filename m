From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Total data limiting
Date: Fri, 17 Jan 2003 19:28:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030117192857.17e25dc8.arnt@c2i.net>
References: <Pine.LNX.4.40.0301170955110.5759-100000@wolfman.lanl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.40.0301170955110.5759-100000@wolfman.lanl.gov>
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

On Fri, 17 Jan 2003 09:59:20 -0700 (MST), 
asclark <asclark@lanl.gov> wrote in message 
<Pine.LNX.4.40.0301170955110.5759-100000@wolfman.lanl.gov>:

> Hi.
> 
> I was wondering if anyone had ideas about this.
> I am interested in doing the following:
> 
> Node A connects to Node B through an iptables/netfilter box on port
> 80.
> 
> The netfilter is providing NAT services to Node B and portforwarding.
> 
> Node A then downloads X amount of data from node B.
> 
> When X amount of data reaches a certain limit, say 50mb then the
> netfilter box drops all further connections from Node A for a
> specified period of time, say 12 hours.
> 
> Is this possible with netfilter? would this be something better suited
> to Squid or even perhapse some of the ip and traffic shaping stuff?
> 
> Any advice or pointers would be greatly appreciated.

..have the iptables traffic counters trigger the rule change.  
I _think_ it's possible in iptables alone, either way, it _can_ 
be scripted, "check the counters and then slam the door shut".

.some isp's "offers free limited hispeed traffic", capping it 
to, say, isdn speeds on passing the traffic limit, this latter 
approach needs traffic shaping.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



