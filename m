From: forum@users.pc9.org
Subject: Re: Problem seperating FTP & ms-streaming traffic
Date: Sun, 14 Mar 2004 19:05:56 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <jbm.20040314190556.6adfebe6@alkaid.pc9>
References: <000d01c40a0e$450f0a50$de0aa8c0@comp>
  <200403142221.55622.Antony@Soft-Solutions.co.uk>
  <004801c40a28$7a8a2560$de0aa8c0@comp>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004801c40a28$7a8a2560$de0aa8c0@comp>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> > > I have a problem allowing forwarding of passive internal ftp traffic
> > > and, at the same time disallowing ms-streaming (port 1755).

> You are right, of course, there are a lot more rules, but those are the
> ones that opens up ms-streaming traffic. Well, the complete set of rules
> I use for passive ftp is actually:
> 
> # Accept port 21 out

I don't understand why you need any highport/lowport stuff. I think the 
only time port numbers need to be considered are 21 and 1755 ??

ftp is something that works anyway. So isn't it just a matter of stopping 
packets heading to port 1755 (UDP/TCP)?

-- 
forum@users.pc9.org



