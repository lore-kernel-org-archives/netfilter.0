From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: FTP connection trackung
Date: Mon, 27 Jan 2003 11:06:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019B1D@hslex01.hslbz.local>
References: <FD8F124A387AD6119F7900A0D218B321562146@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B321562146@hslex01.hslbz.local>
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
To: 'Axel Heinrici' <heinrici76@gmx.de>, netfilter@lists.netfilter.org

> It seems that FTP-conntrack doesn't track these non-standard 
> connections. How can I teach netfilter to track these 
> non-standard-ftp-connections?

Load the conntrack and nat ftp-modules appending "ports=<ports>".


Rob


