From: Bob Sully <rcs@malibyte.net>
Subject: RE: some body hacked my system
Date: Tue, 8 Oct 2002 15:07:31 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210081504240.18315-100000@firefox.malibyte.net>
References: <AF435BB1224A4C4888B58C546728EE323005@s2.valiant.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <AF435BB1224A4C4888B58C546728EE323005@s2.valiant.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Keith R. Weiner" <keith@valiant.com>
Cc: Sundaram Ramasamy <sun@percipia.com>, netfilter@lists.netfilter.org


I use ProFTPd.  If you need anonymous access, set it up with 
upload-only privileges (no read or download) on /incoming and do not 
allow the creation of directories.  Set up your other directories as 
download-only.  I have never had a problem with this setup.

HTH -- Bob


On Tue, 8 Oct 2002, Keith R. Weiner wrote:

> That looks like warcraft 3 if I had to take a guess.  It is a very good game. Did you try unarchiving it?
>  
> You can block his ip address, but what is stopping this person from hitting you from another ip?
>  
> Look at your ftp server.  Maybe disable anonymous logins. Maybe put quotas on.  Maybe see if there are any patches to your ftp daemon.
>  
> What kind of ftp server are you using?  WuFTPD, ms IIS, etc...?
>  
> I'm a newbie myself, but I'd just thought that I'd put in my 2 cents.
> 
> -----Original Message-----
> From: Sundaram Ramasamy [mailto:sun@percipia.com]
> Sent: Tuesday, October 08, 2002 11:08 AM
> To: netfilter@lists.netfilter.org
> Subject: some body hacked my system
> 
> 
> Hi,
> 
> I am allowing ftp connection in my firewall, some body used ftp port, filled
> my hard disk space. He logged-in from 68.65.58.159 IP (/var/log/message)
> 
> Oct  8 00:57:03 linux2 ftpd[25101]: FTP LOGIN FROM
> va-staff-u1-c5a-159.frbgva.adelphia.net [68.65.58.159]
> 
> he created directory named WC3 and transfed follwoing files.
> 
> bash-2.04# cd WC3
> bash-2.04# ls
> wc3.part01.rar.gz  wc3.part07.rar.gz  wc3.part13.rar.gz  wc3.part19.rar.gz
> wc3.part02.rar.gz  wc3.part08.rar.gz  wc3.part14.rar.gz  wc3.part20.rar.gz
> wc3.part03.rar.gz  wc3.part09.rar.gz  wc3.part15.rar.gz  wc3.part21.rar.gz
> wc3.part04.rar.gz  wc3.part10.rar.gz  wc3.part16.rar.gz
> wc3.part05.rar.gz  wc3.part11.rar.gz  wc3.part17.rar.gz
> wc3.part06.rar.gz  wc3.part12.rar.gz  wc3.part18.rar.gz
> 
> Is anybody knows what this file used for?
> 
> How will i block this IP Address in my firewall?
> 
> How will i check what else he did on my machine?
> 
> Thanks
> SR
> 
> 
> 

-- 
________________________________________
Bob Sully - Simi Valley, California, USA
http://www.malibyte.net

"The weather is here - wish you were beautiful." - J. Buffett



