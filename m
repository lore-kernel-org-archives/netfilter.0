From: Jason Opperisano <opie@817west.com>
Subject: Re: FTP +SLL + PortForwarding
Date: Wed, 15 Sep 2004 13:57:18 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095271038.3718.80.camel@wolfpack.ljm.dom>
References: <20040915164437.83457.qmail@web20928.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040915164437.83457.qmail@web20928.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 2004-09-15 at 12:44, yann Conan wrote:
> Hi all,
> 
> I'm trying to configure a iptables firewall in a
> structure in double bastion mode.
> 
> this is the configuration:
> 	internet
> 	   :
> 	   :
> 	   :
> 	FW (RH/iptables)
> 	   :
> 	   :
> 	   :
> 	DMZ/w2k/FTPS server
> 	   :
> 	   :
> 	   :
> 	FW(w2k/Isa server)
> 	   :
> 	   :
> 	   :
> 	  LAN
> 	  
> the tranfer of the data from the FTP server must be
> protected with SSL (no SSH)
> 
> for the FTP transfer I make a portForwarding with
> ip_conntrack_ftp and it works.
> 
> but now I would like to know how I have to do to
> PortForward ftp data with SSL.
> There is a problem because iptables must find during
> the FTP connect the random client port in active  FTP
> or the random server port in passive FTP. And if it's
> encrypted with SSL it's impossible for iptables to
> find the right ports.

correct.

> Then I would like to know if it is possible for
> iptables to read SSL or if there is a possibility to
> unencrypt in input, read the FTP connect with
> ip_conntrack_ftp and re-encrypt in output.

no.  connection tracking an SSL-encrypted FTP session is impossible for
the exact reasons you describe.  i once came across an FTP over SSL
client/server that used something called "Clear Control Channel" that
after the user was authenticated, switched the control channel from SSL
to clear text to allow firewalls to read the responses to PASV
requests.  it was proprietary and closed, though.

setup the FTP to respond with a fixed range of ports for passive mode
requests and allow all those ports through to the FTP server--it's your
only option.

-j

-- 
Jason Opperisano <opie@817west.com>


