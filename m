From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Hello -- kind of of topic -- but still related
Date: Wed, 3 Dec 2003 23:36:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312032336.14650.Antony@Soft-Solutions.co.uk>
References: <20031203151030.31eaeacd.mgale@utilitran.com> <200312032234.22291.Antony@Soft-Solutions.co.uk> <20031203162710.540a1fc9.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031203162710.540a1fc9.mgale@utilitran.com>
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

On Wednesday 03 December 2003 11:27 pm, Michael Gale wrote:

> Hello,
>
> 	Thanks for the response -- it starting logging all outbound traffic and
> found that the FTP server is sending out ident request to the Cisco router.
> Which is odd because there is NO ident server on the FTP box and the FTP
> config specifies no Ident lookups.

Ident requests are generally caused by the use of tcpwrappers (see your 
inetd.conf file to confirm this).   You do not need to be running an ident 
server for your machine to send out ident requests (those mean that it is 
acting as a client, asking for responses from some other server).

> The packet leaves from port X to the Cisco on port 113 but then the Cisco
> returns a ACK RST from port number < 10 to port X.

That is not the way TCP is supposed to work.  All responses should be from the 
source port which the original request packet went to as destination port.

If you send a packet to port 113, you should get a reply (whether it's a goood 
one saying "hello" or a bad one saying "no service here") from port 113.

Antony.

-- 
Most people have more than the average number of legs.

                                                     Please reply to the list;
                                                           please don't CC me.


