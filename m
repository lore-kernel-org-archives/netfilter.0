From: "Travis Crook" <travis@visionsbeyond.com>
Subject: Re: ftp forward to internal machine
Date: Tue, 4 Jun 2002 16:17:21 -0600
Sender: netfilter-admin@lists.samba.org
Message-ID: <00a401c20c15$99254bc0$6702a8c0@mindtrip.com>
References: <009201c20c13$347b4140$6702a8c0@mindtrip.com> <200206042212.g54MCKA09444@Networker.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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



> You haven't included port 20.
>
I included port 20 and it seems to work fine now.  Thanks!!  Is is possible
to send it over a different port (i.e. 21345 instead of 21, and 20345
instead of 20)?

> Ftp uses port 21 for the control connection, and port 20 for the data
> connection.   You must translate and forward both of them for ftp to work,
> and even then in these circumstances I think you'll only be able to use
> passive mode.
>
>
> Antony
>
>


