From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ftp forward to internal machine
Date: Tue, 4 Jun 2002 23:26:47 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206042226.g54MQnA10233@Networker.rockstone.co.uk>
References: <009201c20c13$347b4140$6702a8c0@mindtrip.com> <200206042212.g54MCKA09444@Networker.rockstone.co.uk> <00a401c20c15$99254bc0$6702a8c0@mindtrip.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <00a401c20c15$99254bc0$6702a8c0@mindtrip.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Tuesday 04 June 2002 11:17 pm, Travis Crook wrote:

> > You haven't included port 20.
>
> I included port 20 and it seems to work fine now.  Thanks!!  Is is possible
> to send it over a different port (i.e. 21345 instead of 21, and 20345
> instead of 20)?

You'd have to nobble the source code of a client or a server (depending on 
which one you want to think the other end is running on a weird port number) 
to get this to work.

You can't just "ftp ftp.microsoft.com:12345" like you can with http....

Antony.

