From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: ftps and iptables
Date: Thu, 18 Aug 2005 14:52:31 -0500
Message-ID: <4304E6FF.8070206@riverviewtech.net>
References: <E656E2CC1C5AEB42ACB00EB83122C7741FCDB1@farmer.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E656E2CC1C5AEB42ACB00EB83122C7741FCDB1@farmer.vikus.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Try looking in to a reverse proxy (Squid) that support SSL.  This way your clients would FTPS to the proxy box which would in turn connect to the FTPS server behind the firewall.



Grant. . . .

Derick Anderson wrote:
> By default FTPS (FTP over SSL, not to be confused with FTP/SSH or SFTP)
> runs on port 990. It also sounds like you're using passive mode - if so
> you may need to open those ports as well. It would make sense to me
> (although I don't know) that conntrack_ftp could only track unsecured
> FTP sessions since the only indication of a port change is in the packet
> data (which would be encrypted). Someone may know better than I, though.

