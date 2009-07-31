From: Kortheo <kortheo@kwanta.net>
Subject: linking problem
Date: Fri, 31 Jul 2009 17:03:44 +0200
Message-ID: <60051.1249052624@kwanta.net>
Reply-To: kortheo@kwanta.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hey netfilter guys

I am tryin to write java binding for a little program of mine to netfilter_queue

here is source code for jnetfilter.c:


JNIEXPORT jlong JNICALL Java_com_kwanta_firewall_NetfilterQueue_nfqOpen
  (JNIEnv * env, jclass clazz)
{
	jlong pointer;
	struct nfq_handle* handle;
	handle = nfq_open();
	//pointer = &handle;
	return pointer;
}


Everything compiles fine:


**** Build of configuration Debug for project libjnetfilter ****

make all 
Building file: ../jnetfilter.c
Invoking: GCC C Compiler
gcc -I/usr/lib/jvm/java-6-sun/include -I/usr/lib/jvm/java-6-sun/include/linux -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"jnetfilter.d" -MT"jnetfilter.d" -o"jnetfilter.o" "../jnetfilter.c"
Finished building: ../jnetfilter.c
 
Building target: libjnetfilter.so
Invoking: GCC C Linker
gcc -shared -Wl,-soname=libjnetfilter.so -o"libjnetfilter.so"  ./jnetfilter.o   
Finished building target: libjnetfilter.so
 

but it the code does not run, and ldd gave me this:


ldd -d libjnetfilter.so
undefined symbol: nfq_open	(./libjnetfilter.so)
	linux-gate.so.1 =>  (0xb7f06000)
	libc.so.6 => /lib/tls/i686/cmov/libc.so.6 (0xb7da7000)
	/lib/ld-linux.so.2 (0xb7f07000)


im using ubuntu 8.04

can you please help me. Kind Regards

Kortheo




Message sent via Atmail Open - http://atmail.org/
