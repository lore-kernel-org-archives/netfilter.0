From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Packet sniffing... sort of
Date: Sun, 11 Apr 2004 00:43:50 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081658629.2015.13.camel@localhost>
References: <200404110154.39209.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404110154.39209.Antony@Soft-Solutions.co.uk>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Sat, 2004-04-10 at 20:54, Antony Stone wrote:
> Hi people.
> 
> This is not strictly a netfilter question, but I'm wondering if maybe someone 
> can help or make a suggestion?
> 
> I want to pick up a packet stream, but for an HTTPS connection, and using a 
> standard packet sniffer like ethereal just gives me the encrypted SSLv3 
> stuff, not the plaintext data which I need to see.
> 
> Can anyone think how I can see the content of packets from a browser running 
> on my machine, which is posting a form back to a remote server somewhere, 
> using HTTPS?
> 
> I can do anything I want on the client machine (and I can see the source code 
> of the form page too), however when I try sending what I think is the same 
> data back to the server from a Perl program instead of from my browser, the 
> remote server complains at me (and not in a helpful way, either - it says 
> "500 Internal Server Error").
> 
> Any suggestions gratefully received :)
> 
> Regards,
> 
> Antony.

This sounds like a good place for a legitimate man-in-the-middle
attack.  I would suggest taking a look at ettercap
(http://ettercap.sourceforge.net).  I have found it not only a good
security tool but an excellent network analysis tool for tough jobs like
sniffing on switched networks and intercepting and decoding https
streams.  You can run it, place your station between the client and
server and see all the traffic in the clear either in ettercap or in
Ethereal - John

-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


