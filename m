From: Zoilo <zoilo@xs4all.nl>
Subject: Re: How to direct packets to my server. DOES THIS LOOK RIGHT?
Date: Sun, 15 Dec 2002 16:08:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DFC9AFD.6020403@xs4all.nl>
References: <F22R4BnmJZBRZ2ZBHQB0001f322@hotmail.com>
Reply-To: zoilo@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F22R4BnmJZBRZ2ZBHQB0001f322@hotmail.com>
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
To: Joel Linuxdude <linuxlists@hotmail.com>
Cc: netfilter@lists.netfilter.org

Joel Linuxdude wrote:
> My Netfilter firewall (unfortunately) is running also
> my Apache web server, FTP server and Telnet daemon.
> I honestly think this is ok but its confusing me with
> the whole firewall aspect.

Yes and no, i.e. I can agree with the concept, but I really disagree 
with the provided services.

It is OK to provide some services from your firewall, provided that they 
are *secure* services. I would recommend to replace telnet and ftp by 
openssh, as telnet and FTP are both serious security hazards.

Openssh provides sshd (daemon running on your firewall), ssh (secure 
telnet replacement), sftp (secure ftp replacement) and scp (secure 
remote copy); "grep ssh /etc/services" and "grep sftp /etc/services" 
will tell you which ports to open. In case you need to login from a 
Windoze-machine, a utility called "putty" is available on the internet 
for download.

Also make sure that your Apache server software is up-to-date, and *if* 
you use PHP (or you don't, but it is enabled), then carefully check the 
settings in /etc/php.ini: in particular register_globals and 
register_argc_argv should be set to Off, unless you want the whole world 
to be able to setup an environment for your PHP scripts....

With these precautions, I believe that your firewall would be quite well 
protected.

-- 
Z.
---------------------------------------------------------
If all you have is a hammer, everything looks like a nail
---------------------------------------------------------


