From: "Andrew E. Mileski" <andrewm@isoar.ca>
Subject: Re: ftp
Date: Thu, 20 May 2004 22:41:39 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40AD6C63.1050106@isoar.ca>
References: <BAY15-F30mEB4HGXAwx000684fd@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F30mEB4HGXAwx000684fd@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

azeem ahmad wrote:
> hi all
> i m unable to browse ftp. it says
> --------------------------------------------------------------------------------------------------------------------------------------- 
> 
> an error occured opening that folder on the ftp server. make sure you 
> have permissions to access that folder
> details
> 200 type set to A
> 500 Illegal port command
> 500 LPRT not understood
> -------------------------------------------------------------------------------------------------------------------------------------- 

By any chance are you browsing with IE?

If so, go into Tools->Internet Options->Advanced
and check the box to enable: "Use Passive FTP (for firewall
and DSL modem compatibility)", then click OK.

If not, ignore me ;)

-- 
Andrew E. Mileski

