From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Packet sniffing... sort of
Date: Sun, 11 Apr 2004 01:54:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404110154.39209.Antony@Soft-Solutions.co.uk>
Reply-To: Netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@lists.netfilter.org>

Hi people.

This is not strictly a netfilter question, but I'm wondering if maybe someone 
can help or make a suggestion?

I want to pick up a packet stream, but for an HTTPS connection, and using a 
standard packet sniffer like ethereal just gives me the encrypted SSLv3 
stuff, not the plaintext data which I need to see.

Can anyone think how I can see the content of packets from a browser running 
on my machine, which is posting a form back to a remote server somewhere, 
using HTTPS?

I can do anything I want on the client machine (and I can see the source code 
of the form page too), however when I try sending what I think is the same 
data back to the server from a Perl program instead of from my browser, the 
remote server complains at me (and not in a helpful way, either - it says 
"500 Internal Server Error").

Any suggestions gratefully received :)

Regards,

Antony.

-- 
The difference between theory and practice is that in theory there is no 
difference, whereas in practice there is.

                                                     Please reply to the list;
                                                           please don't CC me.


