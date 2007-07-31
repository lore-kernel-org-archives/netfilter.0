From: Klaus Wacker <klaus_gr_W_kl_Acker@web.de>
Subject: FW: Re: getting iptables into embedded kernel
Date: Tue, 31 Jul 2007 16:29:29 +0200
Message-ID: <1530426430@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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



> Betreff: Re: getting iptables into embedded kernel 
 
 The compile does work, but the response on my target says something is wrong: "Cannot execute binary file". It is obvious when you look at the elf header.
 The denx cross-compile does work a little bit differently. I am trying to find out how. 
I assume I have to convince the make-file from denx to call the iptables' one, not other way around.
 Klaus 




called from iptables dir:
PATH=$PATH CROSS_COMPILE=ppc_85xx- ARCH=ppc make NO_SHARED_LIBS=1 KERNEL_DIR=/opt/eldk/usr/src/tq2_lin/


echo $PATH :
/sbin:/usr/sbin:/usr/local/sbin:/opt/gnome/sbin:/root/bin:/usr/local/bin:/usr/bin:/usr/X11R6/bin:/bin:/usr/games:/opt/gnome/bin:/opt/kde3/bin:/usr/lib/jvm/jre/bin:/usr/lib/mit/bin:/usr/lib/mit/sbin:/opt/eldk/bin:/opt/eldk/usr/bin



part from "readelf iptables"

ELF Header:
  Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00 
  Class:                             ELF32
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              EXEC (Executable file)
  Machine:                           Intel 80386                           <<<<<<<<<<<<<<<==================
  Version:                           0x1
  Entry point address:               0x8048150
  Start of program headers:          52 (bytes into file)
  Start of section headers:          674152 (bytes into file)
  Flags:                             0x0
  Size of this header:               52 (bytes)
  Size of program headers:           32 (bytes)
  Number of program headers:         6
  Size of section headers:           40 (bytes)
  Number of section headers:         39
  Section header string table index: 36

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
  [ 0]                   NULL            00000000 000000 000000 00      0   0  0
  [ 1] .note.ABI-tag     NOTE            080480f4 0000f4 000020 00   A  0   0  4
  [ 2] .note.SuSE        NOTE            08048114 000114 000018 00   A  0   0  4
  [ 3] .init             PROGBITS        0804812c 00012c 000017 00  AX  0   0  4
  [ 4] .text             PROGBITS        08048150 000150 075d2c 00  AX  0   0 16




> 
> > 
> > You say that didn't work, can you send some error message ?
> > 
> > Are you sure it's not an cross compile problem, rather than iptables issue ?
> > 
> > Maybe you can look for Dan Kegel's crosstool:
> > http://www.kegel.com/crosstool/
> > (Easy to use)
> > 
> > or
> > 
> > Scratchbox (crosstool environnement)
> > (More complex, but very like your building on THE target machine)
> > 
> > 
> > Regards,
> > 
> > Michael Plourde
> > Digicom Technologies
> > 
> > ----- Original Message -----
> > From: "Klaus Wacker" <klaus_gr_W_kl_Acker@web.de>
> > To: <netfilter@lists.netfilter.org>
> > Sent: Tuesday, July 31, 2007 6:32 AM
> > Subject: getting iptables into embedded kernel
> > 
> > 
> > > On Tuesday 31 July 2007 11:24, Klaus Wacker wrote:
> > > > Yes, did that and then I try to run it but it only says "cannot execute
> > > > binary file"
> > > >What machine were you using to compile the iptables binary?
> > >
> > > >You mentioned, your target machine is a PPC, if you compile iptables on
> > an x86
> > > >machine without cross compiling option for PPC, you will end up with an
> > Intel
> > > >binary that will not run on Power-PC architecture.
> > >
> > > >Frank
> > > I compile on a PC linux box, my target is a PPC 85xx. I use a denx distro.
> > > First I thought this goes into the kernel and the KERNEL_DIR takes care of
> > that.
> > > I did have set my CROSS_COMPILE to my target and did set the PATH as well.
> > I've just tried again with ARCH=ppc and CROSS_COMPILE=ppc_85xx-
> > > ;this doesn't work either.
> > > Klaus
> > > _____________________________________________________________________
> > > Der WEB.DE SmartSurfer hilft bis zu 70% Ihrer Onlinekosten zu sparen!
> > > http://smartsurfer.web.de/?mc=100071&distributionid=000000000066
> > >
> > >
> > >
> > >
> > > --
> > > Internal Virus Database is out-of-date.
> > > Checked by AVG Free Edition.
> > > Version: 7.5.472 / Virus Database: 269.9.6/865 - Release Date: 2007-06-24
> > 08:33
> > >
> > >
> > 
> > 
> 
> 


______________________________________________________________________
XXL-Speicher, PC-Virenschutz, Spartarife & mehr: Nur im WEB.DE Club!		
Jetzt testen! http://produkte.web.de/club/?mc=021130


